require File.join(File.dirname(__FILE__), %w[spec_helper])

class CustomHookType < HookR::Hook
end

describe HookR::Hooks do
  describe "included in a class" do
    before :each do
      @class = Class.new
      @class.instance_eval do
        include HookR::Hooks
      end
    end

    specify { @class.should have(0).hooks }

    describe "and instantiated" do
      before :each do
        @it = @class.new
      end

      specify { @it.should have(0).hooks }
    end

    describe "with an alternate .make_hook() defined and a hook :foo" do
      before :each do
        @class.module_eval do
          def self.make_hook(name, parent, params)
            CustomHookType.new(name, parent, params)
          end
        end
        @class.instance_eval do
          define_hook(:foo)
        end
      end

      specify "the hook type should be defined by .make_hook()" do
        @class.hooks[:foo].should be_a_kind_of(CustomHookType)
      end

      describe "and instantiated" do
        before :each do
          @it = @class.new
        end

        specify "the instance hook type should be defined by .make_hook()" do
          @it.hooks[:foo].should be_a_kind_of(CustomHookType)
        end

      end
    end


    describe "with a hook :foo defined" do
      before :each do
        @class.instance_eval do
          define_hook(:foo)
        end
      end

      specify { @class.should have(1).hooks }

      specify "the hooks should be a HookR::Hook" do
        @class.hooks[:foo].should be_a_kind_of(HookR::Hook)
      end

      describe "and then subclassed" do
        before :each do
          @subclass = Class.new(@class)
        end

        specify "subclass should also have hook :foo" do
          @subclass.hooks[:foo].should_not be_nil
        end

        specify "adding subclass hooks should not change superclass" do
          @subclass.instance_eval do
            define_hook(:bar)
          end
          @subclass.should have(2).hooks
          @class.should have(1).hooks
        end
      end

      describe "and instantiated" do
        before :each do
          @it = @class.new
        end

        specify { @it.should have(1).hooks }
      end

      describe "and then redefined" do
        before :each do
          @class.instance_eval do
            define_hook(:foo)
          end
        end

        it "should still have only one hook" do
          @class.should have(1).hooks
        end
      end
    end

    describe "with hooks :foo and :bar defined" do
      before :each do
        @class.instance_eval do
          define_hook :foo
          define_hook :bar
        end
      end

      specify { @class.should have(2).hooks }

      it "should have a hook named :bar" do
        @class.hooks[:bar].should_not be_nil
      end

      it "should have a hook named :foo" do
        @class.hooks[:foo].should_not be_nil
      end

      it "should have a hook macro for :foo" do
        @class.should respond_to(:foo)
      end

      it "should have a hook macro for :bar" do
        @class.should respond_to(:bar)
      end

      specify "hooks should be instances of Hook" do
        @class.hooks[:foo].should be_a_kind_of(HookR::Hook)
        @class.hooks[:bar].should be_a_kind_of(HookR::Hook)
      end

      describe "given a wildcard callback" do
        before :each do
          @sensor = stub("Sensor")
          sensor = @sensor
          @class.instance_eval do
            add_wildcard_callback :joker do |event|
              sensor.ping(event)
            end
          end
          @it = @class.new
        end

        it "should call back for both hooks" do
          @sensor.should_receive(:ping).twice
          @it.send(:execute_hook, :foo)
          @it.send(:execute_hook, :bar)
        end

        it "should be able to remove the callback" do
          @it.instance_eval do
            remove_wildcard_callback(:joker)
          end
          @sensor.should_not_receive(:ping).with(:foo)
          @sensor.should_not_receive(:ping).with(:bar)
          @it.send(:execute_hook, :foo)
          @it.send(:execute_hook, :bar)
        end
      end

      describe "and instantiated" do
        before :each do
          @it = @class.new
        end

        specify { @it.should have(2).hooks }
      end

      it "should define a Listener class responding to #foo and #bar" do
        @listener_class = @class::Listener
        @listener_class.instance_methods(false).should include("foo", "bar")
      end

      describe "given a subscribed Listener" do
        before :each do
          @listener = stub("Listener", :foo => nil, :bar => nil)
          @it = @class.new
          @it.add_listener(@listener)
        end

        it "should call listener.foo on :foo execution" do
          @listener.should_receive(:foo)
          @it.send(:execute_hook, :foo)
        end

        it "should call listener.bar on :bar execution" do
          @listener.should_receive(:bar)
          @it.send(:execute_hook, :bar)
        end

        specify "the listener should be removable" do
          @it.remove_listener(@listener)
          @listener.should_not_receive(:bar)
          @it.send(:execute_hook, :bar)
        end
      end
    end
  end
end

describe "a no-param hook named :on_signal" do
  before :each do
    @class = Class.new
    @class.instance_eval do
      include HookR::Hooks
      define_hook :on_signal
    end
    @instance      = @class.new
    @instance2     = @class.new
    @class_hook    = @class.hooks[:on_signal]
    @instance_hook = @instance.hooks[:on_signal]
    @event         = stub("Event", :to_args => [], :source => @instance)
  end

  it "should have no callbacks at the class level" do
    @class_hook.should have(0).callbacks
  end

  it "should have no callbacks at the instance level" do
    @instance_hook.should have(0).callbacks
  end

  specify "the instance hook's parent should be the class hook" do
    @instance_hook.parent.should equal(@class_hook)
  end

  describe "given an class level and instance level callbacks" do
    before :each do
      @class.instance_eval do
        on_signal do
          1 + 1
        end
      end
      @instance_hook.add_external_callback do
      # whatever
      end
    end

    it "should have one callback at the class level" do
      @class_hook.should have(1).callbacks
    end

    it "should have one callback at the instance level" do
      @instance_hook.should have(1).callbacks
    end

    specify "there should be two callbacks total" do
      @instance_hook.total_callbacks.should == 2
    end

  end

  describe "given some named class-level block callbacks" do
    before :each do
      @class.instance_eval do
        on_signal :callback1 do
          1 + 1
        end
        on_signal :callback2 do
          2 + 2
        end
      end
    end

    it "should have two callbacks at the class level" do
      @class_hook.should have(2).callbacks
    end

    it "should have no callbacks at the instance level" do
      @instance_hook.should have(0).callbacks
    end

    specify ":callback1 should be the first callback" do
      @class_hook.callbacks[0].handle.should == :callback1
    end

    specify ":callback2 should be the second callback" do
      @class_hook.callbacks[1].handle.should == :callback2
    end

    specify ":callback1 should execute the given code" do
      @class_hook.callbacks[:callback1].call(@event).should == 2
    end

    specify ":callback2 should execute the given code" do
      @class_hook.callbacks[:callback2].call(@event).should == 4
    end
  end
end

describe "a two-param hook named :on_signal" do
  before :each do
    @class = Class.new
    @class.instance_eval do
      include HookR::Hooks
      define_hook :on_signal, :color, :flavor
    end
    @instance      = @class.new
    @instance2     = @class.new
    @class_hook    = @class.hooks[:on_signal]
    @instance_hook = @instance.hooks[:on_signal]
    @event         = stub("Event", :to_args => [])
    @sensor        = stub("Sensor")
  end

  describe "given a four-arg callback" do
    before :each do
      sensor = @sensor
      @class.instance_eval do
        on_signal do |event, color, flavor|
          sensor.ping(event, color, flavor)
        end
      end
      @callback = @class_hook.callbacks[0]
    end

    it "should call back with the correct arguments" do
      @sensor.should_receive(:ping) do |event, color, flavor|
        event.source.should equal(@instance)
        event.name.should == :on_signal
        color.should == :purple
        flavor.should == :grape
      end
      @instance.send(:execute_hook, :on_signal, :purple, :grape)
    end

    specify "the callback should be an external callback" do
      @callback.should be_a_kind_of(HookR::ExternalCallback)
    end
  end

  describe "given a one-arg callback" do
    before :each do
      sensor = @sensor
    end

    it "should raise an exception" do
      lambda do
        @class.instance_eval do
          on_signal do |flavor|
          end
        end
      end.should raise_error(ArgumentError)
    end
  end

  describe "given an implicit no-arg callback" do
    before :each do
      @class.instance_eval do
        on_signal do
          # yadda yadda
        end
      end
      @callback = @class_hook.callbacks[0]
    end

    specify "the callback should be an internal callback" do
      @callback.should be_a_kind_of(HookR::InternalCallback)
    end

  end

  describe "given an explicit no-arg callback" do
    before :each do
      @class.instance_eval do ||
        on_signal do
          # yadda yadda
        end
      end
      @callback = @class_hook.callbacks[0]
    end

    specify "the callback should be an internal callback" do
      @callback.should be_a_kind_of(HookR::InternalCallback)
    end
  end

  describe "given a method callback :do_stuff" do
    before :each do
      @class.module_eval do
        def do_stuff(sensor)
          sensor.ping(:do_stuff)
        end
      end
      @class.instance_eval do
         on_signal :do_stuff
      end
      @callback = @class_hook.callbacks[0]
    end

    specify "the callback should be a method callback" do
      @callback.should be_a_kind_of(HookR::MethodCallback)
    end

    specify "executing the callback should execute :do_stuff" do
      @sensor.should_receive(:ping).with(:do_stuff)
      @instance.send(:execute_hook, :on_signal, @sensor)
    end

    specify "the callback handle should be :do_stuff" do
      @callback.handle.should == :do_stuff
    end
  end

  describe "given a named class-level callback" do
    before :each do
      sensor = @sensor
      @class.instance_eval do
        on_signal :my_callback do
        end
      end
    end

    specify "the callback should be removable" do
      @class.send(:remove_callback, :on_signal, :my_callback)
      @class_hook.should have(0).callbacks
    end
  end

  describe "given an anonymous instance-level callback" do
    before :each do
      @instance.on_signal do |event, arg1, arg2|
        @sensor.ping(event, arg1, arg2)
      end
    end

    specify "the instance should have 1 callback" do
      @instance_hook.should have(1).callbacks
    end

    specify "the callback should be external" do
      @instance_hook.callbacks[0].should be_a_kind_of(HookR::ExternalCallback)
    end

    specify "the callback should call back" do
      @sensor.should_receive(:ping) do |event, arg1, arg2|
        event.source.should == @instance
        event.name.should == :on_signal
        arg1.should == :apple
        arg2.should == :orange
      end
      @instance.send(:execute_hook, :on_signal, :apple, :orange)
    end

    specify "the callback should be removable" do
      @instance.remove_callback(:on_signal, 0)
      @instance_hook.should have(0).callbacks
    end
  end

  describe "given a named instance-level callback" do
    before :each do
      @instance.on_signal :xyzzy do |event, arg1, arg2|
        @sensor.ping(event, arg1, arg2)
      end
    end

    specify "the callback should be removable" do
      @instance.remove_callback(:on_signal, :xyzzy)
      @instance_hook.should have(0).callbacks
    end

  end

  describe "given an instance-level internal callback" do
    before :each do
      sensor = @sensor
      @class.module_eval do
        private
        define_method :secret do
          sensor.ping
        end
      end
      @instance.instance_eval do
        add_callback(:on_signal) do
          secret
        end
      end
    end

    specify "the callback should call back in the instance context" do
      @sensor.should_receive(:ping)
      @instance.send(:execute_hook, :on_signal)
    end
  end

  describe "given three callbacks" do
    def log(*args)
      @log << args
    end

    before :each do
      @log = []
      @instance.on_signal(:cb1) do |event, arg1, arg2|
        log(:cb1_before, event.name, arg1, arg2)
        event.next
        log(:cb1_after, event.name, arg1, arg2)
      end
      @instance.on_signal(:cb2) do |event, arg1, arg2|
        log(:cb2_before, event.name, arg1, arg2)
        event.next(:pish, :tosh)
        log(:cb2_after, event.name, arg1, arg2)
      end
      @instance.on_signal(:cb3) do |event, arg1, arg2|
        log(:cb3_before, event.name, arg1, arg2)
        event.next
        log(:cb3_after, event.name, arg1, arg2)
      end
    end

    it "should be able to execute callbacks recursively" do
      @instance.send(:execute_hook, :on_signal, :fizz, :buzz) do |arg1, arg2|
        log(:inner, arg1, arg2)
      end

      @log.should == [
       [:cb3_before, :on_signal, :fizz, :buzz],
       [:cb2_before, :on_signal, :fizz, :buzz],
       [:cb1_before, :on_signal, :pish, :tosh],
       [:inner,                  :pish, :tosh],
       [:cb1_after,  :on_signal, :pish, :tosh],
       [:cb2_after,  :on_signal, :fizz, :buzz],
       [:cb3_after,  :on_signal, :fizz, :buzz]
      ]
    end


  end

  describe "given a Listener" do
    before :each do
      @listener = stub("Listener")
      @instance.add_listener(@listener)
    end

    it "should pass arguments to listener" do
      @listener.should_receive(:on_signal).with("red", "green")
      @instance.send(:execute_hook, :on_signal, "red", "green")
    end
  end

end

describe HookR::Hook do
  before :each do
    @class = HookR::Hook
    @sensor = stub("Sensor")
    sensor = @sensor
    @source_class = Class.new do
      define_method :my_method do
        sensor.ping(:my_method)
      end
    end
    @source = @source_class.new
    @event  = stub("Event", :source => @source, :to_args => [])
  end

  it "should require name to be a symbol" do
    lambda do
      @class.new("foo")
    end.should raise_error(FailFast::AssertionFailureError)
  end

  describe "named :foo" do
    before :each do
      @it = @class.new(:foo)
      @callback = stub("Callback", :handle => 123)
      @block = lambda {}
    end

    specify { @it.name.should == :foo }

    specify { @it.should have(0).callbacks }

    it "should be equal to any other hook named :foo" do
      @parent = HookR::Hook.new(:parent)
      @other = HookR::Hook.new(:foo, @parent)
      @it.should == @other
      @it.should eql(@other)
    end

    describe "when adding a callback" do
      it "should return the handle of the added callback" do
        @it.add_callback(@callback).should == 123
      end
    end

    describe "given an anonymous external callback" do
      before :each do
        @it.add_external_callback(&@block)
      end

      specify { @it.should have(1).callbacks }

    end

    describe "given a selection of callbacks" do
      before :each do
        sensor = @sensor
        @anon_external_cb  = @it.add_external_callback do
          @sensor.ping(:anon_external)
        end
        @named_external_cb = @it.add_external_callback(:my_external) do
          @sensor.ping(:named_external)
        end
        @anon_internal_cb  = @it.add_internal_callback do ||
          sensor.ping(:anon_internal)
        end
        @named_internal_cb = @it.add_internal_callback(:my_internal) do ||
          sensor.ping(:named_internal)
        end
        @method_cb = @it.add_method_callback(@source_class, :my_method)
      end

      specify { @it.should have(5).callbacks }

      specify "the handles of the anonymous callbacks should be their indexes" do
        @it.callbacks[0].handle.should == 0
        @it.callbacks[2].handle.should == 2
      end

      specify "the add methods should return handles" do
        @anon_external_cb.should == 0
        @named_external_cb.should == :my_external
        @anon_internal_cb.should == 2
        @named_internal_cb.should == :my_internal
        @method_cb.should == :my_method
      end

      specify "the callbacks should have the intended types" do
        @it.callbacks[@anon_external_cb].should be_a_kind_of(HookR::ExternalCallback)
        @it.callbacks[@named_external_cb].should be_a_kind_of(HookR::ExternalCallback)
        @it.callbacks[@anon_internal_cb].should be_a_kind_of(HookR::InternalCallback)
        @it.callbacks[@named_internal_cb].should be_a_kind_of(HookR::InternalCallback)
        @it.callbacks[@method_cb].should be_a_kind_of(HookR::MethodCallback)
      end

      specify "the callbacks should execute in order of addition" do
        @sensor.should_receive(:ping).with(:anon_external).ordered
        @sensor.should_receive(:ping).with(:named_external).ordered
        @sensor.should_receive(:ping).with(:anon_internal).ordered
        @sensor.should_receive(:ping).with(:named_internal).ordered
        @sensor.should_receive(:ping).with(:my_method).ordered

        @it.execute_callbacks(@event)
      end

      it "should be able to iterate through callbacks" do
        callbacks  = []
        @it.each_callback do |callback|
          callbacks << callback.handle
        end
        callbacks.should == [@anon_external_cb, @named_external_cb,
          @anon_internal_cb, @named_internal_cb, @method_cb]
      end

      it "should be able to iterate through callbacks in reverse" do
        callbacks  = []
        @it.each_callback_reverse do |callback|
          callbacks << callback.handle
        end
        callbacks.should == [@method_cb, @named_internal_cb, @anon_internal_cb,
          @named_external_cb, @anon_external_cb]
      end

      it "should be able to clear its own callbacks" do
        @it.clear_callbacks!
        @it.callbacks.should be_empty
      end

      it "should be able to clear all callbacks" do
        @it.clear_all_callbacks!
        @it.callbacks.should be_empty
      end
    end
  end

  describe "with no parent given" do
    before :each do
      @it = HookR::Hook.new(:root_hook)
    end

    it "should have a null parent" do
      @it.parent.should be_a_kind_of(HookR::NullHook)
    end
  end

  describe "given a parent" do
    before :each do
      @event           = stub("Event")
      @parent_callback = stub("Parent callback", :handle => :parent)
      @child_callback  = stub("Child callback", :handle => :child)
      @parent = HookR::Hook.new(:parent_hook)
      @parent.add_callback(@parent_callback)
      @it = HookR::Hook.new(:child_hook, @parent)
      @it.add_callback(@child_callback)
    end

    it "should have a parent" do
      @it.parent.should equal(@parent)
    end

    it "should not be a root hook" do
      @it.should_not be_root
    end

    it "should call parent callbacks before calling own callbacks" do
      @parent_callback.should_receive(:call).with(@event)
      @child_callback.should_receive(:call).with(@event)
      @it.execute_callbacks(@event)
    end

    it "should report 2 total callbacks" do
      @it.total_callbacks.should == 2
    end

    it "should be able to iterate over own and parent callbacks" do
      callbacks  = []
      @it.each_callback do |callback|
        callbacks << callback
      end
      callbacks.should == [@parent_callback, @child_callback]
    end

    it "should be able to reverse-iterate over own and parent callbacks" do
      callbacks  = []
      @it.each_callback_reverse do |callback|
        callbacks << callback
      end
      callbacks.should == [@child_callback, @parent_callback]
    end

    it "should be able to clear its own callbacks, leaving parent callbacks" do
      @it.clear_callbacks!
      @it.callbacks.should be_empty
      callbacks  = []
      @it.each_callback do |callback|
        callbacks << callback
      end
      callbacks.should == [@parent_callback]
    end

    it "should be able to clear all callbacks" do
      @it.clear_all_callbacks!
      @it.callbacks.should be_empty
      callbacks  = []
      @it.each_callback do |callback|
        callbacks << callback
      end
      callbacks.should == []
    end

    it "should leave parent callbacks alone when clearing all" do
      @it.clear_all_callbacks!
      @parent.should have(1).callbacks
    end

    it "should be detached from parent after clearing all callbacks" do
      @it.clear_all_callbacks!
      @it.should be_root
    end
  end

  describe "duplicated" do
    before :each do
      @callback = stub("Callback", :handle => :foo)
      @parent = HookR::Hook.new(:parent)
      @parent.add_callback(@callback)
      @child  = @parent.dup
    end

    it "should have the original as its parent" do
      @child.parent.should equal(@parent)
    end

    it "should have no callbacks of its own" do
      @child.should have(0).callbacks
    end

    specify "parent should still have a callback" do
      @parent.should have(1).callbacks
    end
  end
end

describe HookR::CallbackSet do
  before :each do
    @it = HookR::CallbackSet.new
    @cb1 = HookR::Callback.new(:cb1, 1)
    @cb2 = HookR::Callback.new(:cb2, 2)
    @cb3 = HookR::Callback.new(:cb3, 3)
  end

  describe "given three callbacks" do
    before :each do
      @it << @cb1
      @it << @cb3
      @it << @cb2
    end

    it "should sort the callbacks" do
      @it.to_a.should == [@cb1, @cb2, @cb3]
    end

    it "should be able to locate callbacks by index" do
      @it[1].should equal(@cb1)
      @it[2].should equal(@cb2)
      @it[3].should equal(@cb3)
    end

    it "should return nil if a callback cannot be found" do
      @it[4].should be_nil
    end

    it "should be able to locate callbacks by handle" do
      @it[:cb1].should equal(@cb1)
      @it[:cb2].should equal(@cb2)
      @it[:cb3].should equal(@cb3)
    end
  end
end

describe HookR::Callback, "with handle :cb1 and an index of 1" do
  before :each do
    @block = stub("block", :call => nil)
    @it = HookR::Callback.new(:cb1, 1)
  end

  it "should sort as greater than a callback with index of 0" do
    @other = HookR::Callback.new(:cb2, 0)
    (@it <=> @other).should == 1
  end

  it "should sort as less than a callback with index of 2" do
    @other = HookR::Callback.new(:cb2, 2)
    (@it <=> @other).should == -1
  end

  it "should sort as equal to a callback with index of 1" do
    @other = HookR::Callback.new(:cb2, 1)
    (@it <=> @other).should == 0
  end

  it "should sort as equal to any callback with the same handle" do
    @other = HookR::Callback.new(:cb1, 2)
    (@it <=> @other).should == 0
  end
end

describe "Callbacks: " do
  before :each do
    @handle = :foo
    @sensor = stub("Sensor")
    @index  = 1
    @source = stub("Source")
    @name   = :we_get_signal!
    @arguments = []
    @event = stub("Event", :source => @source)
  end

  describe HookR::ExternalCallback do
    describe "with a no-param block" do
      before :each do
        @block = stub("Block", :arity => 0, :call => nil)
        @it = HookR::ExternalCallback.new(@handle, @block, @index)
      end

      it "should take 0 args from event and call block with no args" do
        @event.should_receive(:to_args).with(0).and_return([])
        @block.should_receive(:call).with()
        @it.call(@event)
      end
    end

    describe "with a two-param block" do
      before :each do
        @block = stub("Block", :arity => 2, :call => nil)
        @it = HookR::ExternalCallback.new(@handle, @block, @index)
      end

      it "should take 2 args from event and call block with 2 args" do
        @event.should_receive(:to_args).with(2).and_return([:a, :b])
        @block.should_receive(:call).with(:a, :b)
        @it.call(@event)
      end
    end
  end

  describe HookR::InternalCallback do
    describe "with a no-param block" do
      before :each do
        source = @source
        @block = lambda do
          source.ping
        end
        @it = HookR::InternalCallback.new(@handle, @block, @index)
      end

      it "should instance eval the block on the event source" do
        @source.should_receive(:instance_eval).and_yield
        @source.should_receive(:ping)
        @it.call(@event)
      end
    end

    describe "with a one-param block" do
      it "should raise error" do
        @block = stub("Block", :arity => 1, :call => nil)
        lambda do
          @it = HookR::InternalCallback.new(@handle, @block, @index)
        end.should raise_error
      end
    end
  end

  describe HookR::MethodCallback do
    describe "with a no-param method" do
      before :each do
        @method = stub("Method", :arity => 0, :call => nil)
        @bound_method = stub("Bound Method", :call => nil)
        @it = HookR::MethodCallback.new(@handle, @method, @index)
      end

      it "should take 0 args from event and call method with no args" do
        @event.should_receive(:to_args).with(0).and_return([])
        @method.should_receive(:bind).with(@source).and_return(@bound_method)
        @bound_method.should_receive(:call).with()
        @it.call(@event)
      end
    end

    describe "with a two-param block" do
      before :each do
        @method = stub("Method", :arity => 2, :call => nil)
        @bound_method = stub("Bound Method", :call => nil)
        @it = HookR::MethodCallback.new(@handle, @method, @index)
      end

      it "should take 2 args from event and call method with 2 args" do
        @event.should_receive(:to_args).with(2).and_return([:a, :b])
        @method.should_receive(:bind).with(@source).and_return(@bound_method)
        @bound_method.should_receive(:call).with(:a, :b)
        @it.call(@event)
      end
    end
  end

  describe HookR::BasicCallback, "handling a two-arg event" do
    before :each do
      @event.stub!(:arguments => [:a, :b])
    end

    describe "given a zero-param block" do
      before :each do
        @block = stub("Block", :arity => 0)
      end

      it "should bitch about arity" do
        lambda do
          @it    = HookR::BasicCallback.new(@handle, @block, @index)
        end.should raise_error(ArgumentError)
      end
    end

    describe "given a one-param block" do
      before :each do
        @block = stub("Block", :arity => 1)
        @it    = HookR::BasicCallback.new(@handle, @block, @index)
      end

      it "should pass the event as the only argument to the block" do
        @block.should_receive(:call).with(@event)
        @it.call(@event)
      end
    end

    describe "given a two-param block" do
      before :each do
        @block = stub("Block", :arity => 2)
      end

      it "should bitch about arity" do
        lambda do
          @it    = HookR::BasicCallback.new(@handle, @block, @index)
        end.should raise_error(ArgumentError)
      end
    end
  end
end

describe HookR::Event do
  describe "with three arguments" do
    before :each do
      @source              = stub("Source")
      @name                = :on_signal
      @arguments           = ["arg1", "arg2", "arg3"]
      @it = HookR::Event.new(@source,
                             @name,
                             @arguments)
    end

    describe "given an arity of -1" do
      it "should convert to four arguments" do
        @it.to_args(-1).should == [@it, *@arguments]
      end
    end

    describe "given an arity of 2" do
      it "should raise an error" do
        lambda do
          @it.to_args(2)
        end.should raise_error
      end
    end

    describe "given an arity of 3" do
      it "should convert to three arguments" do
        @it.to_args(3).should == @arguments
      end
    end

    describe "given an arity of 4" do
      it "should convert to four arguments" do
        @it.to_args(4).should == [@it, *@arguments]
      end
    end

    describe "given an arity of 5" do
      it "should raise an error" do
        lambda do
          @it.to_args(5)
        end.should raise_error
      end
    end
  end
end

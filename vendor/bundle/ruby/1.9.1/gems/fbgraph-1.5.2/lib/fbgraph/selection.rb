module FBGraph
  class Selection < Base
    
    OBJECTS = %w(user album event group link note page photo post status video comment checkin).freeze
   
    CONNECTION_TYPES = %w(home photos comments feed	noreply	
                          maybe invited attending declined picture 
                          members tagged links groups albums	
                          statuses	videos notes posts events friends	
                          activities interests music books movies television	
                          likes inbox outbox updates accounts checkins).freeze
   
    OBJECTS.each do |object|
      class_eval  <<-METHOD
        def #{object}(object)
          find(object)
          self
        end
     METHOD
    end
   
    CONNECTION_TYPES.each do |object|
      class_eval  <<-METHOD
        def #{object}
          connection('#{object}')
          self
        end
      METHOD
    end


    def me
      find('me')
    end
   
    def metadata
      @params.merge!({:metadata => '1'})
      self
    end   

    def picture(type='square')
      params = {:type => type}
      params.merge!(:access_token => @client.access_token) unless @client.access_token.blank?
      uri = [@client.facebook_uri , build_open_graph_path(@objects , 'picture' , params)].join('/')
    end

  end
end

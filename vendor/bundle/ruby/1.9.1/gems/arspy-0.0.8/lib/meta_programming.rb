require 'meta_programming/object'

module MetaProgramming
end

Object.send :include, MetaProgramming::Object


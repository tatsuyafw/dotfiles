if Pry::VERSION >= "0.12"
  Pry.config.prompt = [
    proc {|target_self, nest_level, pry|
      nested = (nest_level.zero?) ? '' : ":#{nest_level}"
      "[#{pry.input_ring.size}] #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}(#{Pry.view_clip(target_self)})#{nested}> "
    },
    proc {|target_self, nest_level, pry|
      nested = (nest_level.zero?) ?  '' : ":#{nest_level}"
      "[#{pry.input_ring.size}] #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}(#{Pry.view_clip(target_self)})#{nested}* "
    }
  ]
else
  Pry.config.prompt = [
    proc {|target_self, nest_level, pry|
      nested = (nest_level.zero?) ? '' : ":#{nest_level}"
      "[#{pry.input_array.size}] #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}(#{Pry.view_clip(target_self)})#{nested}> "
    },
    proc {|target_self, nest_level, pry|
      nested = (nest_level.zero?) ?  '' : ":#{nest_level}"
      "[#{pry.input_array.size}] #{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}(#{Pry.view_clip(target_self)})#{nested}* "
    }
  ]
end

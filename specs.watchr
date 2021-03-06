watch('specs/pet_shop_spec\.rb') { |m| ruby m[0] }
watch('pet_shop\.rb') { |m| ruby "./specs/pet_shop_spec.rb" }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
Signal.trap('QUIT') { ruby tests  } # Ctrl-\
Signal.trap('INT' ) { abort("\n") } # Ctrl-C

# --------------------------------------------------
# Helpers
# --------------------------------------------------
def ruby(*paths)
  run "ruby #{gem_opt} -I.:lib:test -e'%w( #{paths.flatten.join(' ')} ).each { |p| require p }'"
end

def tests
  Dir['test/**/test_*.rb'] - ['test/test_helper.rb']
end

def run( cmd )
  # puts   cmd
  system 'clear'
  system cmd
end

def gem_opt
  defined?(Gem) ? "-rubygems" : ""
end
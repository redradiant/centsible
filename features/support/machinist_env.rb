# Load the blueprints from over in spec support.
load Rails.root.join("spec/support/blueprints.rb")

# Reset the Machinist cache before each scenario.
Before { Machinist.reset_before_test }

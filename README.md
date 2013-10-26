# CommitParamRouting

Many times we might end up using html forms with multiple submit buttons with different behaviours. In those cases, it would be ideal to route
to different controller actions. 
This gem uses rails [advanced constraints](http://guides.rubyonrails.org/routing.html#advanced-constraints) to get this done.

## Installation

Add this line to your application's Gemfile:

    gem 'commit_param_routing'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install commit_param_routing

## Usage

Consider you have a resource and you wanna route to three different actions from the same form with three different submit buttons. Then the route would be

```ruby
resources :plan do
  post :save, constraints: CommitParamRouting.new(PlansController::SAVE, ProjectsController::REVISE), action: :save
  post :save, constraints: CommitParamRouting.new(PlansController::PROPOSE), action: :propose
  post :save, constraints: CommitParamRouting.new(PlansController::FINALIZE), action: :finalize
end 
```

And the `plans_controller.rb` would be,

```ruby
class PlansController < ApplicationController
  SAVE = "Save"
  REVISE = "Revise the plan"
  PROPOSE = "Propose now"
  FINALIZE = "Finalize"

  def save
    #some code here
  end

  def propose
    #some code here
  end

  def finalize
    #some code here
  end
end
```

```haml
  = form_for @plan, url: plan_save_path(@plan), method: :post do |f|
    =# some form elements here
    - if @plan.can_be_revised?
      = f.submit PlansController::REVISE
    - if @plan.can_be_finalized?
      = f.submit PlansController::FINALIZE
    = # other submit buttons
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


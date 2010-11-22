module Itinerary
module Actions
class  Supplement
  
  include Nestable
  
  def initialize(task)
    super
    @task = task
  end
  
  def to_s
    "SUPPLEMENT: #{@task}"
  end
  
end end end
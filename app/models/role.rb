class Role < ActiveRecord::Base
  has many :auditions

 def actors 
    self.auditions.map {|audition| audition.actor}
  end

  def locations
    self.auditions.map {|audition| audition.location}
  end

  def lead
    result = self.auditions.find {|audition| audition.hired}
        result
  else 
    "no actor has been hired for this role"
  end
  
  def understudy 
    study = self.auditions.filter {|audition| audition.hired}
    if study[1]
        study [1]
    else 
        'no actor has been hired for understudy for this role'
    end
  end
end
class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name] }
  validates :artist_name, presence: true
  # validates :released, inclusion: {in: [true, false]}
  validate :check_release_year

  def check_release_year
     if release_year.nil? && released == true
       errors.add(:release_year, "cannot be nil when released is true")
     elsif release_year
       less_than_current_year
     end
  end
  
  def less_than_current_year
     if release_year > Date.today.year
       errors.add(:release_year, "must be less than current year")
     end
  end
  # def released?
  #   released
  # end
end

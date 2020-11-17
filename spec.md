Specifications for the Rails Assessment
Specs:
 
 Using Ruby on Rails for the project
 Include at least one has_many relationship (User has_many Events, User has_many Reviews)
 Include at least one belongs_to relationship (Review belongs_to an Event)
 Include at least two has_many through relationships (User has_many :reviewed_events, through: :reviews, source: :event, Event has_many :reviewers, through: :reviews, source: :user)
 Include at least one many-to-many relationship (User has_many :reviewed_events, through: :reviews)
 The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (review.title, review.content)
 Include reasonable validations for simple model objects (User validates :username, presence: true, uniqueness: true)
 Include a class level ActiveRecord scope method (Event.upcoming)
 Include signup (Devise)
 Include login (Devise)
 Include logout (Devise)
 Include third party signup/login (Devise/OmniAuth)
 Include nested resource show or index (events/2/reviews)
 Include nested resource "new" form (events/1/reviews/new)
 Include form display of validation errors (events/new)
Confirm:
 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 Views use partials if appropriate
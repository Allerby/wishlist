class Present < ApplicationRecord

  # broadcasts_to -> (present) { "presents" }
  after_create_commit { byebug }
end

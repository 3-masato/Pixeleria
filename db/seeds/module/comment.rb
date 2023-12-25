require_relative "../util/chalk"
module Seeds
  class Comments
    NUMBER_OF_POSTS = 50
    MIN_COMMENTS_PER_POST = 2
    MAX_COMMENTS_PER_POST = 30

    def self.create
      artworks = Artwork.all.sample(NUMBER_OF_POSTS)

      artworks.each do |artwork|
        rand(MIN_COMMENTS_PER_POST..MAX_COMMENTS_PER_POST).times do
          user = User.all.sample
          random_time = rand(1.year.ago..Time.current)
          comment = artwork.comments.create!(
            user: user,
            content: Faker::Lorem.sentence,
            created_at: random_time,
            updated_at: random_time
          )
          Chalk.info("Create Comment from user \"#{user.display_name}\" to artwork \"#{artwork.title}\".")
        end
      end
    end
  end
end
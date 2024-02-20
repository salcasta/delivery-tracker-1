desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  User.destroy_all
  Post.destroy_all

  usernames = ["alice", "bob", "carol", "dave", "eve"]

  usernames.each do |username|
    user = User.new
    user.email = "#{username}@example.com"
    user.password = "password"
    user.save

    10.times do
      post = Post.new
      post.user_id = user.id
      post.description = Faker::Commerce.product_name
      post.detail = "#{["FedEx", "UPS", "USPS"].sample} tracking ##{rand(1000000000000)}" if rand < 0.5
      post.arrive_on = Faker::Date.between(from: 1.month.ago, to: 2.weeks.from_now)

      if post.arrive_on < Time.now
        post.arrived = [true, false].sample
      else
        post.arrived = false
      end

      post.save
    end
  end
end

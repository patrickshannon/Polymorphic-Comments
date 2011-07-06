#  begin
#    namespace :db do
#      desc "Populate the development database with some fake data"
#      task :populate => :environment do
#        5.times do
#          Article.create! :title => Forgery::LoremIpsum.sentence, :body => Forgery::LoremIpsum.paragraphs(3)
#        end
#      end
#    end
#  rescue LoadError
#    puts "Please run: sudo gem install forgery"
#  end

namespace :db do
   desc "Testing populator"
   task :populate => :environment do
		require "populator"
		require "faker"
		Article.populate(15) do |article|
			article.title = Populator.words(5..10).titleize
			article.body = Populator.sentences(100..300)
			article.created_at = 4.years.ago..Time.now
		end
		
		User.populate 3 do |user|
			user.name = Faker::Internet.user_name
			user.email = Faker::Internet.email
			user.password = BCrypt::Engine.hash_secret('password')
			user.created_at = 4.years.ago..Time.now
		end
   end
end


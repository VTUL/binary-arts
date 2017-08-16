namespace :binaryarts do
  desc 'Create default roles.'
  task add_roles: :environment do
    ['admin', 'collection_admin', 'collection_user'].each do |role_name|
      Role.find_or_create_by({name: role_name})
      puts "Created role '#{role_name}'."
    end
  end

  desc 'Upgrade users to admins.'
  task upgrade_users: :environment do
    admin_role = Role.find_by({name: 'admin'})

    IO.foreach('admin_list.txt') do |email|
      email = email.strip
      user = User.find_by({email: email})

      if user.nil?
        user = User.new(email: email)
      end

      user.roles << admin_role
      user.roles = user.roles.uniq
      user.save!
      puts "#{email} upgraded."
    end
  end

  desc 'Update carousel images from zip.'
  task :update_images, [:image_zip] => :environment do |task, args|
    image_zip_path = args.with_defaults(image_zip: nil)[:image_zip]
    FileUtils.mkdir_p(Rails.root.join('app/assets/images/vtul/carousel/'))
    images = Dir.glob(Rails.root.join('app/assets/images/vtul/carousel/*.[Jj][Pp][Gg]'))
    unless images.empty?
      images.each do |image|
        puts "Deleting #{image}"
      end
      FileUtils.rm(images)
    end
    unless image_zip_path.nil?
      system("unzip -jd #{Rails.root.join('app/assets/images/vtul/carousel/')} #{image_zip_path}")
    end
  end
end

class BaseWorkerJob
  include Sidekiq::Job
  sidekiq_options queue: 'mailers'

  def perform(user_id)
  
    # Do something
    @user=User.find(user_id)
    UserMailer.with(user: @user).registration_confirmation.deliver_later
  end
end

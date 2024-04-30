class CreateUser
  include Sidekiq::Worker
  queue_as :default

  def perform
    User.create(name: 'Teste')
  end
end
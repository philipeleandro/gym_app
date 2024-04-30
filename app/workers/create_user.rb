class CreateUser
  include Sidekiq::Worker

  def perform
    User.create(name: 'Teste')
  end
end
class CreateUser
  include Sidekiq::Worker

  def perform
    User.create(namne: 'Teste')
  end
end
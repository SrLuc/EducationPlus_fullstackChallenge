# app/models/student.rb
class Student < ApplicationRecord
  validates :cpf, presence: true, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: "formato de CPF inválido" }
end

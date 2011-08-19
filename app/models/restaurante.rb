class Restaurante < ActiveRecord::Base

  has_attached_file :foto, styles: { medium: "300x300#", thumb: "100x100#" }

  validates_attachment_presence :foto
  validates_attachment_size :foto, less_than: 5.megabytes
  validates_attachment_content_type :foto, content_type: %w(image/png image/jpeg image/pjpeg image/gif image/tiff)					   
  
  validates_presence_of :nome, :message => "deve ser preenchido"
  validates_presence_of :endereco, :message => "deve ser preenchido"
  validates_presence_of :especialidade, :message => "deve ser preenchido"
  
  validates_uniqueness_of :nome, :message => "nome ja cadastrado"
  validates_uniqueness_of :endereco, :message => "endereco ja cadastrado"

  validate :primeira_letra_deve_ser_maiuscula

  private
  def primeira_letra_deve_ser_maiuscula
    errors.add("nome", "primeira letra deve ser maiuscula") unless nome =~ /[A-Z].*/
  end

  has_many :qualificacaos
  has_many :comentarios, :as => :comentavel
  has_and_belongs_to_many :pratos

  scope :massas, where( :especialidade => "massas" )
  scope :recentes, where([ " created_at > ? ", 3.months.ago])
  scope :pelo_nome, order('nome')

end

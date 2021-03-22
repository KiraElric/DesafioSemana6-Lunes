class Band < ApplicationRecord
  has_many :concerts, dependent: :destroy
  enum kind: [:band, :soloist]

  def to_s
    name
  end

  #Metodo para conocer la cantidad de conciertos por banda
  def concert_count
    self.concerts.count
  end

  #Metodo para conocer el total de audiencia de todos los conciertos de una banda
  def total_attendence
    self.concerts.sum(:attendance)
  end

  #Metodo para conocer los conciertos realizados en el mes en curso
  def current_concert
    self.concerts.where('date between ? and ?', Date.today.beginning_of_month, Date.today.end_of_month).size
  end

  #Metodo para conocer el maximo de audiencia de un concierto de una banda
  def max_attendance
    self.concerts.pluck(:attendance).max
  end

  #Metodo para conocer la maxima duracion de un concierto de una banda
  def max_duration
    self.concerts.maximum(:duration)
  end

  #Metodo para conocer el ultimo concierto de una banda con la fecha escrita en palabras
  def last_concert
    self.concerts.maximum(:date).strftime("%Y - %B - %A")
  end
end

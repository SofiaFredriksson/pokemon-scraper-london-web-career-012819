require 'pry'
class Pokemon
  attr_reader :id, :name, :type, :db, :hp




  def self.save(name, type, db )
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db:db)
  end

  def initialize(id: , name: , type: , hp: nil, db:  )
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp=? WHERE id=?", new_hp, self.id)
  end
end

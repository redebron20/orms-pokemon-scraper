class Pokemon
    attr_accessor :id, :name, :type, :db
    
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon(name, type) VALUES (?, ?);"
        db.execute(sql, name, type)
    end

    def self.find(id_num, db)
        sql = "SELECT * FROM pokemon WHERE pokemon.id = ?"
        info = db.execute(sql, id_num)[0]
        Pokemon.new(id: info[0], name: info[1], type: info[2], db: db)
    end

end

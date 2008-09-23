# Find-by_sql is the devil.
# Have you tried adding associations, using conditions, joins, includes, select, etc?
# If you are really sure (ie. you are calling a stored procedure) you can use find_by_with_excuse

module ActiveRitalin
  def self.append_features(klass)
    super
        
    klass.class_eval %(      
      def self.find_by_sql_with_excuse(excuse, sql)
        RAILS_DEFAULT_LOGGER.warn("Find By Sql called with excuse: " + excuse )
        find_by_sql(sql)
      end

      class << self
        private :find_by_sql
      end
    )      
  end
end

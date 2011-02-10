module TenThousand
  module API
    def self.versions
      [Version1]
    end

    class Version1 < Grape::API
      version 'v1'

      get 'test' do
        {:success => :ok}
      end

      get 'expertises'
      get 'expertises/:expertise_id' # include logs, limit to some default (20?  a month?) with an override, and a max
      post 'expertises'  # create
      post 'expertises/:expertise_id' # update
      post 'expertises/:expertise_id/log' # create
      post 'expertises/:expertise_id/log/:log_id' # update
      delete 'expertises/:expertise_id/log/:log_id'
    end
  end
end

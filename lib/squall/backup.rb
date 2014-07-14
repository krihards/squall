module Squall

  class Backup < Base

    def restore(id)
      request(:post, "/backups/#{id}/restore.json")
    end

    def delete(id)
      request(:delete, "/backups/#{id}.json")
    end
  end

end

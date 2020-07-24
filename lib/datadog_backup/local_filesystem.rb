module DatadogBackup
  module LocalFilesystem

    def all_files(backup_dir)
      ::Dir.glob(::File.join(backup_dir, '**', '*')).select { |f| ::File.file?(f) }
    end

    def find_file_by_id(backup_dir, id)
      ::Dir.glob(::File.join(backup_dir, '**', "#{id}.*")).first
    end
  end
end

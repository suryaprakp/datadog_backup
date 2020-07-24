require 'spec_helper'

describe DatadogBackup::LocalFilesystem do
  include DatadogBackup::LocalFilesystem
  let(:tempdir) { Dir.mktmpdir }

    describe '#all_files' do
      before(:example) {
        File.new("#{tempdir}/all_files.json", 'w')
      }
      
      after(:example) {
        FileUtils.rm "#{tempdir}/all_files.json"
      }
      
      subject { all_files(tempdir) }
      it { is_expected.to eq(["#{tempdir}/all_files.json"] ) }
      
    end
    
    describe '#find_file_by_id' do
      before(:example) {
        File.new("#{tempdir}/find_file.json", 'w')
      }
  
      after(:example) {
        FileUtils.rm "#{tempdir}/find_file.json"
      }
  
      subject { find_file_by_id(tempdir, 'find_file') }
      it { is_expected.to eq "#{tempdir}/find_file.json" }
  
    end
  end
  
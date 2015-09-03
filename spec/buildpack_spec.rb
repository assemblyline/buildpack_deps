require 'serverspec'

describe 'Buildpack Deps' do

  describe 'packages' do
    it 'does not need package upgrades' do
      expect(command('apt-check').stderr.chomp).to eq '0;0'
    end

    %w( apt-transport-https autoconf bzip2 ca-certificates curl g++ gcc git
      imagemagick libbz2-dev libc6-dev libcurl4-openssl-dev libgdbm-dev
      libevent-dev libffi-dev libglib2.0-dev libjpeg-dev libmagickcore-dev
      libmagickwand-dev libmysqlclient-dev libpq-dev libreadline-dev
      libsqlite3-dev libssl-dev libxml2-dev libyaml-dev make openssh-client
      patch wget zlib1g-dev
    ).each do |p|
      it "has the #{p} package installed" do
        expect(package(p)).to be_installed
      end
    end
  end

  describe 'env' do
    it 'sets LANG to en_GB' do
      expect(env['LANG']).to eq 'en_GB.UTF-8'
    end

    it 'sets LANGUAGE to en_GB' do
      expect(env['LANGUAGE']).to eq 'en_GB.UTF-8'
    end

    it 'sets LC_ALL to en_GB' do
      expect(env['LC_ALL']).to eq 'en_GB.UTF-8'
    end
  end

  describe 'locales' do
    it 'includes en_GB' do
      expect(locales).to include('en_GB.utf8')
    end
  end

  def env
    @_env ||= Hash[command('env').stdout.split.map { |pair| pair.split('=') }]
  end

  def locales
    command('locale -a').stdout.split
  end
end

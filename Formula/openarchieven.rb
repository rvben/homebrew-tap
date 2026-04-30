class Openarchieven < Formula
  desc "Command-line interface to the openarchieven.nl Dutch genealogical API"
  homepage "https://github.com/rvben/openarchieven-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.2.1/openarchieven-0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "0d140320de244a27697d76a4865318b0144496d9bf33dbc6358555bf31cf9509"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.2.1/openarchieven-0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "2ed863eeccd0356438e4de53981626b88df410862a8486ddb248d5c3e287e778"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.2.1/openarchieven-0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72dfd69d71b891c033c389d4d46f9b909ecd8079dc090d2cea3cfd54f3dc0dea"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.2.1/openarchieven-0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "11ab4d025b58e99e20a39934a6ebc6ffbe5dec939b564e958190694eb8a0dab3"
    end
  end

  def install
    bin.install "openarchieven"
  end

  test do
    system "#{bin}/openarchieven", "version"
  end
end

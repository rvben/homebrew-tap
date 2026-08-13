class Openarchieven < Formula
  desc "Command-line interface to the openarchieven.nl Dutch genealogical API"
  homepage "https://github.com/rvben/openarchieven-cli"
  version "0.4.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.5/openarchieven-0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "e934a13016cd7bc460a3d989988231c5d50b1407a8a4818895585b3306b89495"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.5/openarchieven-0.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "f822e5f38c6de64aa9c73a16587f9cbfe6b7fca541dbc18b52acb2a2d726d932"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.5/openarchieven-0.4.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80729779645ac92b517a4037c373bc32e836bffcef38c2000a21bdacf7a59d08"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.5/openarchieven-0.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "825e7a186b4c9884219196782b6670cb06dc1e0b6fcebacee1d5465a4e0dbe80"
    end
  end

  def install
    bin.install "openarchieven"
  end

  test do
    system "#{bin}/openarchieven", "version"
  end
end

class Openarchieven < Formula
  desc "Command-line interface to the openarchieven.nl Dutch genealogical API"
  homepage "https://github.com/rvben/openarchieven-cli"
  version "0.4.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.6/openarchieven-0.4.6-aarch64-apple-darwin.tar.gz"
      sha256 "e02b39ebf3a06f086f4848d360dd3e1f7ce0214d65ea608cf0df9afdf8729b55"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.6/openarchieven-0.4.6-x86_64-apple-darwin.tar.gz"
      sha256 "b525f6162aad557c980da475f9e9998504de592e10fb8f779171491669922bfd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.6/openarchieven-0.4.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eaf732aea669bed379a9fb6907d33d7282866123b492cf0c9e9e8e51cbdc4cc1"
    else
      url "https://github.com/rvben/openarchieven-cli/releases/download/v0.4.6/openarchieven-0.4.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f75847714ac48987c013331f9cb73f2ccbfb8c9cdb6fc9099cd5230e77c41cd4"
    end
  end

  def install
    bin.install "openarchieven"
  end

  test do
    system "#{bin}/openarchieven", "version"
  end
end

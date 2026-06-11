class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.6/husker-v0.4.6-aarch64-apple-darwin.tar.gz"
      sha256 "7a0de7bebc131afa435cf801ca1152b0d415c0088aabf933a189ead55e01eea4"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.6/husker-v0.4.6-x86_64-apple-darwin.tar.gz"
      sha256 "e2328ad8fbbe30292f862a9328fd36916f206f6b4cd93e3cc0b1a9041823264c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.6/husker-v0.4.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9ed11ea5f4939735e8bca951b969048fc727ee7303da1b264335584f07dbcec"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.6/husker-v0.4.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0804dc16bc11b6eb98659a1d440a1556bbb918253dea3abbeb6d9e938cd886f6"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end

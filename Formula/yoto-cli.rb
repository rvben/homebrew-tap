class YotoCli < Formula
  desc "Manage Yoto Make Your Own playlists from the command line: sign in, upload audio, create and inspect content."
  homepage "https://github.com/rvben/yoto-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yoto-cli/releases/download/v0.1.0/yoto-cli-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "d90c29ff251fc7e163e18cc44f58d2d7f4f2c5252a70d11f896862138de3812a"
    else
      url "https://github.com/rvben/yoto-cli/releases/download/v0.1.0/yoto-cli-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "964b4a8e8cd11ede147a639585bc6f5f7b1e89d6fdb11566c48fcf05cb0a5a62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yoto-cli/releases/download/v0.1.0/yoto-cli-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d216aeeacc65d9431378423947e6372e18c90c0b39b9bd9d635bfdfca5fa0814"
    else
      url "https://github.com/rvben/yoto-cli/releases/download/v0.1.0/yoto-cli-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "05a78e1161be90091b8f8fe7560945983c41e78159d909f778bc521ead592247"
    end
  end

  def install
    bin.install "yoto-cli"
  end

  test do
    system "#{bin}/yoto-cli", "--version"
  end
end

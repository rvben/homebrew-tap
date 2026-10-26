class YotoCli < Formula
  desc "Manage Yoto Make Your Own playlists from the command line: sign in, upload audio, create and inspect content."
  homepage "https://github.com/rvben/yoto-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yoto-cli/releases/download/v0.2.0/yoto-cli-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "42d7003bbdbbb5c87532293f733eb3502067f7cf722eda3a42f27802b8ab2280"
    else
      url "https://github.com/rvben/yoto-cli/releases/download/v0.2.0/yoto-cli-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "6ec791d1feccb5a00263e5f5fb616743759d900eac1aa3722c9012d95d760b53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yoto-cli/releases/download/v0.2.0/yoto-cli-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aaebba8448c7e48f8b603c63c300527f6e7c2be6b28275386046d915645ca4d6"
    else
      url "https://github.com/rvben/yoto-cli/releases/download/v0.2.0/yoto-cli-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef0627544e1137ef78bc24e01e5e65ffcc87742be0f221d3cba86ecc08473dfb"
    end
  end

  def install
    bin.install "yoto-cli"
  end

  test do
    system "#{bin}/yoto-cli", "--version"
  end
end

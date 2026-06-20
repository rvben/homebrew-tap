class Recur < Formula
  desc "A human-friendly cron job manager"
  homepage "https://github.com/rvben/recur"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/recur/releases/download/v0.1.0/recur-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "bb9793b455acc04e40635975fbdff750bc97918ae1868ce20dc18e9ac27713db"
    else
      url "https://github.com/rvben/recur/releases/download/v0.1.0/recur-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "8d1a3618d784a90c1486fbe28477af68b40cea9e3effcfe9e0db402b20a4ec70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/recur/releases/download/v0.1.0/recur-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "765b3f7b0a83777930116d459704b80d1a45460a1601a94f35c2a3191bbd41ec"
    else
      url "https://github.com/rvben/recur/releases/download/v0.1.0/recur-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e924e996c68b77c5259b99f80a425ee800387505ab64602ec18f36a4d4b6827"
    end
  end

  def install
    bin.install "recur"
  end

  test do
    system "#{bin}/recur", "--version"
  end
end

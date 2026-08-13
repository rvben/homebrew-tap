class HomeassistantCli < Formula
  desc "CLI for Home Assistant"
  homepage "https://github.com/rvben/homeassistant-cli"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.3/homeassistant-cli-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "80577d38f2b42d64f5fff3f3137b5e00407854aeed609beef1307aa14e610940"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.3/homeassistant-cli-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "efecd3359f856a240dc58e4819d0fafc4284f49306c8acc25f9a7f662ae05012"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.3/homeassistant-cli-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e815bacbf93515924d16c9a075ac18aae754b4b0e8c671c2d0f1e5def4edbbc3"
    else
      url "https://github.com/rvben/homeassistant-cli/releases/download/v0.2.3/homeassistant-cli-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a4b330acbc8a0f5cdfd991de84fd35bc40a1c65cc58a7389aba8e7f4263edfb"
    end
  end

  def install
    bin.install "ha"
  end

  test do
    system "#{bin}/ha", "--version"
  end
end

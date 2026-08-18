class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.0/unifi-cli-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "d3e2c3c0e5e23b7309c2c53b84b4f497ff859ca22f2af145ff612909dc89f5d6"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.0/unifi-cli-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "a22af9eb12132af4affea1b922f546d235095ed2308d84453c208bed1ef947ca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.0/unifi-cli-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80e08226b67731c9efc9bc5da5200559ffc777235bbf06b94c537d12e16c4f4e"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.0/unifi-cli-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1350ebd3313da778daeee2540ef79bdf6a5e9e82e702134645ec5bb39cfe3df"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end

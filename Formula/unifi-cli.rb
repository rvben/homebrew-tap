class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.2/unifi-cli-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "cc0b36650ad1102ae3001f0b934b45c4d1abafc96967c9beea1fc912f2dad326"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.2/unifi-cli-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "acdd356564675262d6f4ba3d0f3b20728f2f2c8131a271aa5d119c3fbcbf4660"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.2/unifi-cli-v0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ae9c9645d3a2dc59dbe4b9d7c1b4a3e00d15a3d6c9e45ca24289dc0855ca537"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.2/unifi-cli-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b45f54ba782d3a4342e20d80e34cb0ebc4f632db5b9e2f520c0ae950315d3273"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end

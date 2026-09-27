class ShellyCli < Formula
  desc "Fast CLI for discovering, monitoring, and controlling Shelly devices"
  homepage "https://github.com/rvben/shelly-cli"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "fcbe6b7d84e1511877b05c8510ae5e268d85a8268d848ae329d47628d7ce3316"
    else
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b4d1323baf214aa781b7049d0904b4d3968b4395c8602b44dece836efb108f36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b28c6f00a41f22bc14bdcd2f52dc9fc8930dbece2ceefe2e378630957dc4cd10"
    else
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e07d37f3820beff694fa506ae96bab0754bfeb2da8393898b77a870b2ad1223c"
    end
  end

  def install
    bin.install "shelly"
    bin.install_symlink "shelly" => "shelly-cli"
  end

  test do
    assert_match "shelly #{version}", shell_output("#{bin}/shelly --version")
  end
end

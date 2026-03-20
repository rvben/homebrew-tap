class ShellyCli < Formula
  desc "Fast CLI for discovering, monitoring, and controlling Shelly devices"
  homepage "https://github.com/rvben/shelly-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1e61ffc78c7b63f1e2105df3064c04766a845140993074e9c23d13ff37d4c030"
    else
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "59759cca3150df5d2f1b66db2ef9b13da97f27f4254103f29dc6acf5ead872db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97d90adde9df3092f460e427229164835b451aa2a40bf1b8c72625f9e94114f8"
    else
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de171b11dbfd13ffb14f99e3be53d0f736270a006be7b1468f88045cc257ebde"
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

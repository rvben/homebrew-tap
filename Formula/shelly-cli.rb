class ShellyCli < Formula
  desc "Fast CLI for discovering, monitoring, and controlling Shelly devices"
  homepage "https://github.com/rvben/shelly-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "10bc6fb6b358a25537729485772c91d9bfd0aef94b970ed02a4d609f0ac781b1"
    else
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "422f377e183c321a183f61ddc0ee625fd0b513f3a8919e1c6dca296f6ecfb03d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "68e41bbc5da57a9a2020001c4fce04c92b07e53178fe554379fed2e888f326d8"
    else
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "01cd33509f5f7669b875245e2a2f049a1239fe97790d451f36bfe76f7e5f1979"
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

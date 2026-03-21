class ShellyCli < Formula
  desc "Fast CLI for discovering, monitoring, and controlling Shelly devices"
  homepage "https://github.com/rvben/shelly-cli"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2e3f8c0e962629769fb6692e381187d2c243bb48082260d26aac6ed02a908e39"
    else
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "641f8bd3adf6ab7b8a8db2aea9dbc16003000075c580560478ebfc9e3c5776a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42976d8694b1af4a8dab212df0ee4cd85ae18c1e086da6d70b0022498ca5fbdd"
    else
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a556038c30d5beffed50c2af1f02a6c8de1daabba25156d9d1674d79c1fbd98f"
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

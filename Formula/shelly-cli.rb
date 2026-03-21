class ShellyCli < Formula
  desc "Fast CLI for discovering, monitoring, and controlling Shelly devices"
  homepage "https://github.com/rvben/shelly-cli"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "22ac523668b896c88c9abca73a467b385de15fbb8efe48c5a8c4959039720e67"
    else
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "162f4bbf60ebbef9cb3042ff4353acbd0186519cd7ee2ce118eece0eea15bb7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4c8fc961da4c7ef55fa9c2154ffcd895e96538bbb44c8e0a597495746e83512d"
    else
      url "https://github.com/rvben/shelly-cli/releases/download/v#{version}/shelly-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e562f03395c5182d0b8f84460527cb0040cf5341b66606b4bb274fa80925302"
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

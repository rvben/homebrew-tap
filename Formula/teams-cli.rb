class TeamsCli < Formula
  desc "Manage Microsoft Teams from the terminal"
  homepage "https://github.com/rvben/teams-cli"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/teams-cli/releases/download/v0.2.6/teams-cli-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "7d5d0d6ae1a46cd2f8168a8ed35c6768cb3a31ec3f8ec25c56d47fbdab2b3e00"
    else
      url "https://github.com/rvben/teams-cli/releases/download/v0.2.6/teams-cli-v0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "2ea305293fb7c92c1ed8d78a2ffbd36eb8cb7931574d73a30e087009d68b00d0"
    end
  end

  on_linux do
    depends_on "perl" => :build
    depends_on "rust" => :build

    on_arm do
      url "https://static.crates.io/crates/teams-cli/teams-cli-0.2.6.crate"
      sha256 "c2f510bf6be73611506b639d35da59f09f440a96a03cb71d04d429a1aa8d1a4c"
    end
    on_intel do
      url "https://static.crates.io/crates/teams-cli/teams-cli-0.2.6.crate"
      sha256 "c2f510bf6be73611506b639d35da59f09f440a96a03cb71d04d429a1aa8d1a4c"
    end
  end

  def install
    if OS.linux?
      system "cargo", "install", *std_cargo_args, "--bin", "teams"
    else
      bin.install "teams"
    end
    bin.install_symlink "teams" => "teams-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/teams --version")
    assert_match version.to_s, shell_output("#{bin}/teams-cli --version")
    assert_match "Usage:", shell_output("#{bin}/teams --help")
  end
end

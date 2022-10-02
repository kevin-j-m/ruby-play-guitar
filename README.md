# Anyone Can Play Guitar (With Ruby)

[Presentation Site](https://kevinjmurphy.com/play-guitar/)

## Abstract

I've got the blues. I've been looking for the perfect guitar tone, but haven't found it. To amp up my mood, let's teach a computer to play the guitar through an amplifier.

Let's string together object-oriented principles to orchestrate a blues shuffle. We'll model our domain with the help of inheritance, composition, and dependency injection. This talk will strike a chord with you, whether you've strummed a guitar before or not.

## Code Examples

### Heavy Strings

* Identifying [string gauge](https://github.com/kevin-j-m/ruby-play-guitar/blob/f47462730423038a4a7268396ef476afdcf81953/lib/blues/guitar_string.rb#L29-L41)

### Tune Low

* All tuning logic inside [Guitar class](https://github.com/kevin-j-m/ruby-play-guitar/commit/a9ada3431ed0399d4eb402de4aa6ac32d92bde1f)
* Fancy `tune` method with [metaprogramming](https://github.com/kevin-j-m/ruby-play-guitar/commit/ecd5390b8189ea7c2c3d3000ed21077b10a01c09)
* Extract related behavior into [Tuner class](https://github.com/kevin-j-m/ruby-play-guitar/commit/ca9926489fd2e9f96a05861017de6d6c297388a5)
* Extract different tunings into [separate classes](https://github.com/kevin-j-m/ruby-play-guitar/commit/30ff81980c74850594b3269f5ecb0aacfa294e14)

### Play Hard

* Picking [guitar](https://github.com/kevin-j-m/ruby-play-guitar/blob/f47462730423038a4a7268396ef476afdcf81953/lib/blues/guitar.rb#L12-L17) relies on the [GuitarString class](https://github.com/kevin-j-m/ruby-play-guitar/blob/f47462730423038a4a7268396ef476afdcf81953/lib/blues/guitar/finger_position.rb#L13)

### Floor It

* Separate [Note class](https://github.com/kevin-j-m/ruby-play-guitar/blob/f47462730423038a4a7268396ef476afdcf81953/lib/blues/note.rb)

### Amplifier

* Base [Amplifier class](https://github.com/kevin-j-m/ruby-play-guitar/blob/f47462730423038a4a7268396ef476afdcf81953/lib/blues/amplifier.rb)

### Tube Amp

* [Tube Amplifier class](https://github.com/kevin-j-m/ruby-play-guitar/blob/35bfae5bbdf4137da1621d594292b85169174e7a/lib/blues/tube_amplifier.rb)

### Solid State Amp

* [Solid State Amplifier class](https://github.com/kevin-j-m/ruby-play-guitar/blob/ffa09293c0c7b77330ae44200a4704f475826672/lib/blues/solid_state_amplifier.rb)

### Hybrid Amp

* Decompose tube amp stages into [modules](https://github.com/kevin-j-m/ruby-play-guitar/commit/f0c4920dd1dbb604d103c414fa9a74b3e4f9e71b)
* Decompose solid state amp stages into [modules](https://github.com/kevin-j-m/ruby-play-guitar/commit/8fc7141ec45647d20520724efe976bc6801866a6)
* [Hybrid amp class](https://github.com/kevin-j-m/ruby-play-guitar/blob/f47462730423038a4a7268396ef476afdcf81953/lib/blues/hybrid_amplifier.rb) composes tube and solid state behavior, inherits from the base amplifier

### Plug Amp into Guitar

* Create amplifier when [creating a guitar](https://github.com/kevin-j-m/ruby-play-guitar/commit/14bd984866268f3a23aa6f55cf8d4def38c11775)
* [Dependency inject](https://github.com/kevin-j-m/ruby-play-guitar/commit/0d16dfda62b923de58a6dd61d393d052a81b023d) amplifier into guitar

### Playing with Sonic Pi

* [Sonic Pi amplifier](https://github.com/kevin-j-m/ruby-play-guitar/blob/f47462730423038a4a7268396ef476afdcf81953/lib/blues/sonic_pi_amplifier.rb)
* [Play blues shuffle](https://github.com/kevin-j-m/ruby-play-guitar/blob/f47462730423038a4a7268396ef476afdcf81953/lib/plug_in_pi_shuffle.rb) through Sonic Pi amplifier

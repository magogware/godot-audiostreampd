# godot-audiostreampd
A Godot add-on to stream audio from a Pure Data patch

## What's Pure Data?
Pure Data (often shortened to Pd) is an open source visual programming language for multimedia, but for audio in particular.
Pd gives you an environment with several audio generation and manipulation primitives that can be wired together (patched) to
create music, ambient audio, sound effects, or just about any other form of sound you'd like.

## Why bother integrating Pd into Godot? Why not just use samples?
Samples aren't particularly reactive; they're not very well suited to an interactive medium where players may interact with
the world in constantly unique ways. Sound doesn't behave that way in the real, embodied world, so why should we let our
virtual environments suffer from less immersion?

Pd allows you to make patches that can receive inputs via messages, meaning you can create a reactive audio system that
updates in real-time with parameters taken from your players' interactions. You can make more dynamic sound effects,
a more responsive, mood-heightening soundtrack, and more! And the best part is that this system doesn't have to replace
existing sample-based workflows. You can use Pd to play a sample and adjust it dynamically rather than having to make a whole
system from scratch that creates the same sound.

## Is this a new thing?
You're flattering to suggest that, but no. FMOD, Wwise, and a whole host of other libraries let you do this with Unity and
Unreal, and, in some cases, Godot, too. However, there's not really an open-source toolchain for adaptive audio that integrates
with Godot. Moreover, some may find the complexity of FMOD or Wwise off-putting; Pd is a lot less intimidating but just as
powerful.

## How do I use this?
Proper documentation will be coming soon, but there is a fully-fledged example project in the `example` directory. It has a
pretty complete demonstration of the functionality this plugin offers without being too complex. Check it out to get a feel
for the plugin, and for a good introduction to Pd, check out [this series](https://www.youtube.com/watch?v=SLx7kjuFheY) on YouTube.

## Anything else?
There's a backend to this plugin called `godot-pdstream` that contains the GDNative code that actually integrates Pd (or, rather, libpd)
with the engine. You can check that out (here)[https://github.com/magogware/godot-pdstream].

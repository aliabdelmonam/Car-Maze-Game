import processing.sound.*;
//nnnnnnnnw
class GameSoundManager {
    // Sound file references
    private SoundFile carCrashSound;
    private SoundFile carWinSound;
    private SoundFile carBoomSound;
    private SoundFile carCoinSound;
    private SoundFile carLoseSound;
    // Reference to parent sketch
    private PApplet parent;
    
    // Volume control
    private float masterVolume = 0.3;
    
    // Flag to track if any sound is playing
    private boolean isSoundPlaying = false;
    
    // Constructor
    GameSoundManager(PApplet parent) {
        this.parent = parent;
        loadSounds();
    }
    
    // Load all sound files
    private void loadSounds() {
        try {
            carCrashSound = new SoundFile(parent, "collision.mp3");
            carWinSound = new SoundFile(parent, "win.mp3");
            //carBoomSound = new SoundFile(parent,"Boom.mp3");
            carCoinSound = new SoundFile (parent,"coin.mp3");
            carLoseSound = new SoundFile (parent,"lose1.mp3");
        } catch (Exception e) {
            parent.println("Error loading sound files: " + e.getMessage());
        }
    }
    
    // Check if any sound is currently playing
    private boolean isAnySoundPlaying() {
         return (carCoinSound.isPlaying() ||
                 carWinSound.isPlaying()  ||
                 carCrashSound.isPlaying());
    }
    
    // Play crash sound
    public void playCrashSound() {
        if (carCrashSound != null && !isAnySoundPlaying()) {
            carCrashSound.play();
            carCrashSound.amp(masterVolume);
        }
    }

    public void playWinSound() {
        if (carWinSound != null && !isAnySoundPlaying()) {
            carWinSound.play();
            carWinSound.amp(masterVolume);
        }
    }
    
     public void playLoseSound() {
        if (carLoseSound != null && !isAnySoundPlaying()) {
            carLoseSound.play();
            carLoseSound.amp(masterVolume);
        }
    }

   /* public void playBoomSound() {
        if (carBoomSound != null && !isAnySoundPlaying()) {
            carBoomSound.play();
            carBoomSound.amp(.1);
        }
    }*/
    
    // Stop all sounds
    /*public void stopAllSounds() {
        if (carCrashSound != null && carCrashSound.isPlaying()) {
            carCrashSound.stop();
        }
        if (carWinSound != null && carWinSound.isPlaying()) {
            carWinSound.stop();
        }
        if (carBoomSound != null && carBoomSound.isPlaying()) {
            carBoomSound.stop();
        }
    }*/
    public void playCoinSound(){
        if (carCoinSound != null && !isAnySoundPlaying()) {
            carCoinSound.play();
            carCoinSound.amp(masterVolume);
        }
    
    }
 
    // Adjust master volume
    public void setVolume(float volume) {
        this.masterVolume = constrain(volume, 0, 1);
    }
}

// ActionScript file
	   import flash.events.Event;
	   import flash.events.MouseEvent;

       

	   private function leftPrompts():void
       {       	
       	this.currentState = "left";
       	arrowleft.source = "./assets/arrow.png";
       	showImage(arrowleft);
       	if(audioQueue.length>0)
       	{
       		audioQueue.removeAll();
       	}
       	addAudio("./assets/trial loops/3 what is this.mp3");
       	addAudio("./assets/silence.mp3");
       	//addAudio("./assets/trial loops/5 it is a cat.mp3");		
       	addAudio("./assets/trial loops/it is a "+ sItem.item1 +".mp3");		
       	playIntroAudio();
       }
       
	   private function rightPrompts():void
       {      
       	this.currentState = "right";
       	arrowright.source = "./assets/arrow.png";
       	showImage(arrowright);
       	if(audioQueue.length>0)
       	{
       		audioQueue.removeAll();
       	}
       	addAudio("./assets/trial loops/3 what is this.mp3");
       	addAudio("./assets/silence.mp3");       	
       	//addAudio("./assets/trial loops/4 it is a ball.mp3");
       	addAudio("./assets/trial loops/it is a "+ sItem.item2 +".mp3");				
       	playIntroAudio();
       }
       
       public var boxSource:String = "";
       
       private function reveal(obj:String):void
       {       	        
       	  		this.currentState = "win";			   
	        	if(obj.indexOf("reveal") == -1)
	        	{
	        			
	        		boxSource = "./assets/images/"+ obj +".jpeg";
	        		      			        		
	        	}
	        	if(audioQueue.length>0)
		       	{
		       		audioQueue.removeAll();
		       	}
		       	addAudio("./assets/trial loops/12 lets open up the box and see.mp3");
		       	playIntroAudio();
		       	var revealTimer:Timer = new Timer(6000, 1);
        		revealTimer.addEventListener(TimerEvent.TIMER_COMPLETE, revealHandler);
        		revealTimer.start();
		       
			    
       }
       
       private function revealHandler(event:Event):void
       {
       			
	        	//box.source = "./assets/"+ obj +".jpg";
	        		
	        	box.source = boxSource;
	        	box.visible = true;      			        		
	        	      			        		
	        	if(audioQueue.length>0)
		       	{
		       		audioQueue.removeAll();
		       	}
       			addAudio("./assets/applause.mp3");		
		       	addAudio("./assets/conclusion/that was fun thank you for playing with me.mp3");
		       	if(sReader.syllabusItemCounter < 9)
		       	{
		       		addAudio("./assets/trial loops/13 lets play again.mp3");
		       	}
		       	playIntroAudio();
       }
       
       private function edge():void
       {
       	  if(audioQueue.length>0)
   		  {
		       	audioQueue.removeAll();
		  }
		  var r:int = rand(1,3);
	      if(r==1)
	      {
	      	addAudio("./assets/edge cases/i love this game.mp3");
	      }
		  else if(r==2)
		  {
		  	addAudio("./assets/edge cases/lets play.mp3");
		  }
		  else if(r==3)
		  {
		  	addAudio("./assets/edge cases/this is my favorite game.mp3");
		  }       	  
		  playIntroAudio();
       }
       
       
       private function game():void
       {
       		sItem = sReader.getNextSyllabusItem();
        	//Alert.show(sItem.item1); 
        	determineCharacterMood("neutral");       	
       	    this.currentState = "game";
        	obj1.x=0;
        	obj1.y=0;
        	obj2.x=647;
        	obj2.y=0;
        	hideImage(box);	
        	//obj1.source = "./assets/cat.jpg";
			obj1.source = "./assets/images/"+ sItem.item1 +".jpeg";
			showImage(obj1);
			//obj2.source = "./assets/ball.jpg";
			obj2.source = "./assets/images/"+ sItem.item2 +".jpeg";
			showImage(obj2);
			snd = new Sound(new URLRequest("./assets/trial loops/2 hmm what items do we have to choose from.mp3"));
			snd.play();
			snd.addEventListener(Event.OPEN, openSoundHandler);
		    var channel:SoundChannel = snd.play();
		    channel.addEventListener(Event.SOUND_COMPLETE, introSoundHandler);			
       }
       
       private function intro():void
       {       		
       		characterMood = "intro";
       		this.currentState = "intro";       
       		callout.source = "./assets/callout.png";
       		showImage(callout);	    
		    //playVideo();   
		    if(audioQueue.length>0)
       		{
       			audioQueue.removeAll();
       		}
		    addAudio("./assets/introduction/hi my name is spot.mp3");
		    addAudio("./assets/trial loops/0 im going to show you two items.mp3");
		    addAudio("./assets/trial loops/1 lets begin.mp3");
		    playIntroAudio();
       }
     
       private function startGame():void
       {
		       	if(audioQueue.length>0)
		       	{
		       		audioQueue.removeAll();
		       	}
       	        addAudio("./assets/trial loops/6 i am going to choose one of these things.mp3");
		    	playIntroAudio();
				hideImage(arrowleft);
        		hideImage(arrowright);
        		obj1.source = "./assets/qm.png";
        		obj2.source = "./assets/qm.png";
        		
        		var myTimer1:Timer = new Timer(5000, 1);
        		myTimer1.addEventListener(TimerEvent.TIMER_COMPLETE, timerHandler);
        		myTimer1.start();        		 		
	   } 	   	   
	   
       private function characterHappy():void
       {
				
       	  		this.currentState = "box";
				if(rand(1,2)==1)
				{
					videoDisplay.source = "./assets/hyper.mp4";
										
				}
				else
				{
					videoDisplay.source = "./assets/playful.mp4";
				}
				if(audioQueue.length>0)
			    {
			       		audioQueue.removeAll();
			    }
			   addAudio("./assets/trial loops/9 yes great question.mp3");
		       addAudio("./assets/trial loops/11 ask another question or just guess.mp3");
		       playIntroAudio();
       }
       
       private function characterSad():void
       {
       	 		this.currentState = "box";				
				videoDisplay.source = "./assets/headshake.mp4";
				if(audioQueue.length>0)
			    {
			       		audioQueue.removeAll();
			    }
				addAudio("./assets/trial loops/10 no keep going doing well.mp3");
		    	addAudio("./assets/trial loops/11 ask another question or just guess.mp3");
		    	playIntroAudio();				
       }
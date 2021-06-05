### Big learning curve
We worked in an office at ACE Project Space and we also have access to the High-Performance Computer (HPC) at the space. Before I joined the team. the president spent years reading about Machine Learning and Artificial Intelligence, while the architect from Silicon Valley is a technical expert in Software Development and Deployment. Under their guidance, I was given a first task - train a face recognition model.

Every day, my mentors fed me a lot of information and tutorials that they found useful. Most of the time I was doing research and learning about Machine Learning training in general. Honestly, In my life, I could never absorb that big amount of information in a short period of time. It was my biggest learning curve ever. The team worked efficiently. My mentors were clearing the path ahead while I was following them, working on the details, collecting the diamonds on the ground until we could gather everything we need.

In the meantime, I also built some examples of Machine Learning projects that convinced me that I was on the right path. We worked really hard even on the weekend as well. I constantly reported my learning progress to my mentor every day.

I had to change the mindset of a Software Engineer and moving toward Machine Learning Engineer's mindset. It was hard but also interesting to solve problems in a different way.

### The challenging
We wanted the machine learning model to work on an embedded device. Using an existing model isn't a hard thing but optimizing it so that it can work on a specific device is a real challenge. It has to be optimized so that it is fast enough to capture and process the input with a limited computing resource. Just only manually deploy a working model on a device would take us like 4 hours.

I initially played around and train the existing model. After I reached a certain level of confidence, I started to adjust the CNN architecture and implement my own training strategy. Thanks to my excellent coding skills, I could easily get familiar with Machine Learning frameworks like TensorFlow, Keras, PyTorch. Very early, we could start the training, but nothing really comes out of it for 3 months. This was the time we started to realize we need more data.

### Look for more data and rebuild the model and data pipeline
Collecting the data wasn't a hard thing. There is a lot of data on Kaggle and opened data from many institutes all over the world. Some may require you to talk to the data owner, but normally they would give you the access to data. However, making the collected data usable is a different story.

A common mistake a could see from many online tutorials was they usually put pre-processing in the training, which is way worse in terms of efficiency. It is understandable how quick those tutorials were made. It's good to work on the data flow first to analyze and decide which task should run offline, and which task is needed for the training. It will make your model faster in both training time and test time.

Let's take a look at one of the practical examples in solving a face recognition problem to see how we can improve test time. Many beginners tend to save the original image which is bad for local storage and also it takes computation time in the test time. A good way that I found was to split the model into 2 sub-models. The first one receives pre-processed inputs and turns them into face embedding. This is the time-consuming part. The last one which is faster is the classifier. By these little changes in deployment strategy, your model only needs to do embedding when it needs to. And because of that, it saves a lot of computation power.

Training time can also be optimized as well. Because it most time-consuming part. So try your best to do most of the things offline by splitting the model or saving pre-processed data before the train. it may reduce a significant amount of train time. Transfer learning is also a thing that anyone should look at. The idea of transfer learning is to freeze some specific layers from the trained model and only do the training on a classifier layer or any layers you want to optimize the parameters.

#### Monitor the training
Training monitoring is the most interesting part personally. It takes a lot of time but it is enjoyable.
It is time I feel calm down and think of the training you have just started. It is also the time I enjoy my coffee, walking around and talk to people in the office, tell them about my new training strategy, and hoping for the best result coming out of it.

Sometimes, it is also when I have gone through half of the training but I may realize that I have done something wrong and decide to start another training.

Many machine learning developers believe training time is the best time to read papers. Personally, I found during the training time, I liked to read and absorb more theory or implement the new training strategy.

The things above may not interest you. Ok, below is something cool to look at during training time. It is the user interface of TensorBoard, playing around with it while training the model is also fun!
<div>
    <img src="assets/db/img/blogs/LifeElevated_01.gif" class="blog-image" />
</div><br/>

### Software Engineering takes Machine Learning to the next level
Many people claim that you don't need to know much about software to get into Machine Learning. It may be true in big organizations where Data Scientists just focus on training and optimizing models. However, if you are working for start-ups like me at the time, things may be different.

Personally feel my software engineering background was a big help. I could automate a lot of the training tasks. Most of the time, I am the only person who used the HPC at the space. I usually set up python script that automates the tunning. My scripts usually took a week or two running continuously on the HPC. It saved a lot of my time so that I could learn more about the theory parts and focus more on the ideas.
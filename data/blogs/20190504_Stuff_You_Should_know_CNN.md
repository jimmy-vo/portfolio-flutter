#### Research existing solutions
The first example I found comes with its dataset. But when you do a lot of training, you will find that you need more data to increase performance. There is a lot of data on Kaggle and opened data around. Finding data sometimes is not enough, there are a couple of tricks to get you more data that you can find in CNN tutorials. My favorite one is data argumentation.


#### Build the model
Building a CNN architecture is not an easy part. If it is your first CNN project, I would recommend not to change the CNN architecture until you understand the overall picture.

There are many existing famous CNN Architectures that you can use in whatever CNN framework you are using (Keras or Pytorch): LeNet, AlexNet, VGG, GoogLeNet, ResNet. Honestly, I have no idea how researchers could come up with a good performance architecture. I guess the only way is to brute-force search until they get a good one. And as a software engineer who is using CNN as a tool, I don't want to reinvent the wheels.

Instead of that, what I would do is to define the dimensions of the input and output. And then I will pick an existing CNN architecture, adjust it a bit to fit the dimensions, and see what I can get from the training.

#### Hyperparameter tuning

Training tuning is another big story. Adjusting a CNN architecture or changing the pipeline requires tunning rework on hyperparameter. Because of that, this step should be done at last. One common mistake of most beginners is not being able to distinguish between hyperparameter and model parameters. Model parameters including the `weight` and `bias` in each layer. `weight` and `bias` are calculated by the training framework's optimizers (Adam, SGD, RMSprop). Model parameters are used in both train and test time, while hyperparameters are only used in training time. Below are some of the hyperparameters you should look at:
* Learning parameter
* Number of Epochs
* Momentum
* Regularization constant
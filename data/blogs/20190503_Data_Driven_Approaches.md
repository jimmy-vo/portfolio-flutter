#### Categories
I started by looking at the course about Convolutional Neural Networks (CNN) from the University of Stanford [here](http://cs231n.stanford.edu/), where I learned about `Data-Driven Approaches`.

Whatever approaches to use, the ultimate goal is to increase the training performance, reduce the loss, and enhance the speed of the model (test time). They are categorized into two types of approaches:

##### 1. Memory-base approach:
* Pros: train fast, simple
* Cons: test slow, high lost
* Classifier: `K-Nearest Neighbor`

##### 2. Parametric Approach
* Pros: test fast, low lost
* Cons: train slow, complicated
* Classifier:
* Linear Classifier: `SVM`, `Softmax`, `Square SVM Classifier`
* Non-linear Classifier: `Neural Network`

As you can see, people are talking about `Neural Network` all the time but it is just a subset of `Data-Driven Approaches`. For some simple problems, you don't need a Neral Network. In most cases, you don't even need to use any Data-Driven approach. It may be just faster to use rule-based logic to get the job done.


#### Linear Classifiers
The most basic thing I believe any beginner should look at is `Linear Classifiers`. A machine learning engineer should understand how `weight` and `bias` are being used in a `Linear Classifier`.

`Loss Function` is like a guide, who navigates the parameters moving toward a correct direction and corrects them if they go in the wrong way. There are some famous loss functions you should look at (`Hinge`, `Hinge Square`, and `Softmax`). In some cases, you have to come up with your own loss function.

Then the next step is to train a `classifier` by different `optimizers`. The worst but simplest way is `Random Search`. The more popular one is `Gradient Descent`.

When you have gone through all above steps, it is the time you need to take a step back, look at the whole thing to think about the data flow and make sure that you understand `Batch`, `Epoch`, `Step Size`, `Regulation`

At this step, you don't need to be supper focusing on the performance because we all want to move on bigger things. But spending a couple of time running the training and tun the parameter will help you understand things better on the way.

`Hyperparameter` is also an important topic. After you could get the first model trained, you will start to think about `over-fitting` and `under-fitting`. There are several tricks that could help you `fine-tune` training to achieve better performance. Sometimes, knowledge can't explain everything. You would build your own intuitive on the way.

#### Neural Networks - Convolution Neural Networks
The single-layer `Perceptron` is a linear classifier and the simplest form of the `artificial neural networks` (ANN). It is also interesting to note that the Perceptron is identical to Stochastic Gradient Descent (SGD), which is a common optimizer.
I found a chart below from Fjodor vanVeem:
<div>
<img src="assets/db/img/blogs/LifeElevated_02.jpg" class="blog-image" />
</div> <br/>

From the chart, we can see `Convolution Neural Networks` are just a subset of `Neural Networks`

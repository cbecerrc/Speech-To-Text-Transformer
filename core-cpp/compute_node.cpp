#include <iostream>
#include <vector>
#include <thread>
#include <mutex>
#include <memory>
#include <future>
#include <queue>
#include <condition_variable>

template<typename T>
class ThreadSafeQueue {
private:
    mutable std::mutex mut;
    std::queue<std::shared_ptr<T>> data_queue;
    std::condition_variable data_cond;
public:
    ThreadSafeQueue() {}
    void wait_and_pop(T& value) {
        std::unique_lock<std::mutex> lk(mut);
        data_cond.wait(lk, [this]{return !data_queue.empty();});
        value = std::move(*data_queue.front());
        data_queue.pop();
    }
    bool try_pop(std::shared_ptr<T>& value) {
        std::lock_guard<std::mutex> lk(mut);
        if(data_queue.empty()) return false;
        value = data_queue.front();
        data_queue.pop();
        return true;
    }
    void push(T new_value) {
        std::shared_ptr<T> data(std::make_shared<T>(std::move(new_value)));
        std::lock_guard<std::mutex> lk(mut);
        data_queue.push(data);
        data_cond.notify_one();
    }
};

// Optimized logic batch 1583
// Optimized logic batch 6088
// Optimized logic batch 8181
// Optimized logic batch 9863
// Optimized logic batch 2729
// Optimized logic batch 2954
// Optimized logic batch 5513
// Optimized logic batch 3271
// Optimized logic batch 3494
// Optimized logic batch 7067
// Optimized logic batch 1763
// Optimized logic batch 6594
// Optimized logic batch 2649
// Optimized logic batch 8579
// Optimized logic batch 8734
// Optimized logic batch 7236
// Optimized logic batch 8972
// Optimized logic batch 8810
// Optimized logic batch 4095
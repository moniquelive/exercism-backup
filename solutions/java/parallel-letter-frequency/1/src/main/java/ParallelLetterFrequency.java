import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.*;
import java.util.regex.Pattern;

class ParallelLetterFrequency {
    private String[] texts;

    public ParallelLetterFrequency(String[] texts) {
        final Pattern pattern = Pattern.compile("[^\\p{IsAlphabetic}]");
        this.texts = Arrays.stream(texts)
                .map(String::toLowerCase)
                .map(s -> pattern.matcher(s).replaceAll(""))
                .filter(s -> !s.trim().isEmpty())
                .toArray(String[]::new);
    }

    public Map<Character, Integer> countLetters() {
        Map<Character, Integer> frequencyMap = new HashMap<>();
        if (texts.length == 0) {
            return frequencyMap;
        }
        ExecutorService executor = Executors.newFixedThreadPool(texts.length);
        for (String text : texts) {
            Callable<Map<Character, Integer>> task = () -> {
                Map<Character, Integer> map = new HashMap<>();
                for (char c : text.toCharArray()) {
                    map.put(c, map.getOrDefault(c, 0) + 1);
                }
                return map;
            };
            Future<Map<Character, Integer>> future = executor.submit(task);
            try {
                Map<Character, Integer> map = future.get();
                for (Map.Entry<Character, Integer> entry : map.entrySet()) {
                    frequencyMap.put(entry.getKey(), frequencyMap.getOrDefault(entry.getKey(), 0) + entry.getValue());
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        executor.shutdown();
        return frequencyMap;
    }
}